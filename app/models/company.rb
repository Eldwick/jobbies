require 'open-uri'

class Company < ActiveRecord::Base
  has_many :contacts, dependent: :destroy
  has_many :jobs, dependent: :destroy
  before_save :save_lat_long
  scope :search, -> (search) {where("lower(name) like ? AND lower(city) like ? AND lower(category) like ?", "%#{search[:name]}%", "%#{search[:city]}%", "%#{search[:category]}%").uniq}
  geocoded_by :address 

  def address
    return nil if zip_code == 0
    [street_address, city, state, zip_code].compact.join(', ')
  end

  def self.save_geo
    all.each do |company|
      if company.latitude.nil?
        company.save
      end
    end
  end

  def self.addresses_array
    addresses_array = []
    all.each do |company|
      addresses_array << [company.latitude, company.longitude, company.name , company.id, company.img_url, company.jobs.count] if company.longitude 
    end
    addresses_array
  end
  def self.populate 
    link = open("http://www.uspages.com/fortune500.htm")

    doc = Nokogiri::HTML(link)

    info = doc.css('ol li a')

    info.each do |company|
      Company.create_from_linkedin(company.text.downcase)
    end

    link_small_comp = open("http://www.forbes.com/best-small-companies/list/")

    doc_small_comp = Nokogiri::HTML(link_small_comp)

    info_small_comp = doc_small_comp.css('table td h3')

    info_small_comp.each do |company|
      Company.create_from_linkedin(company.text.downcase)
    end
              
  end

  def self.create_from_linkedin(company_input)
    begin
      company_name = company_input.strip.gsub(" ", "-")
      link = open("http://www.linkedin.com/company/#{company_name}")
      doc = Nokogiri::HTML(link)

      name = doc.css('.left-entity h1 span')

      info = doc.css('.basic-info-about ul li')
      website = info.css('.website p')
      category = info.css('.industry p')
      num_employees = info.css(".company-size p")

      address =  doc.css('p.adr')
      street_address = address.css('.street-address')
      state = address.css('.region')
      city = address.css('.locality').text.gsub(",",'')
      zip_code = address.css('.postal-code').text.to_i

      street_address_string = ''
      street_address.each {|addr| street_address_string += " #{addr.text}"}

      picture = doc.css('.hero-img')

      if picture[0] == nil
        picture = doc.css('.header .image')
      end

      companyInfo = {
        name: name.text.gsub("\n",'').strip,
        street_address: street_address_string,
        city: city,
        state: state.text,
        zip_code: zip_code,
        num_employees: num_employees.text.gsub("\n",''),
        category: category.text,
        website: website.text.gsub("\n",''),
        img_url: picture[0]['src']
      }

      company = Company.create(companyInfo)

    rescue  
      puts 'No Company Found'
      return nil 
    end 

    create_jobs(company_name, company)
    add_review(company_name, company)
    company
  end

  def self.add_review(company_name, company)
    begin
      link = open("http://www.careerbliss.com/#{company_name}/reviews/")

      doc = Nokogiri::HTML(link)

      info = doc.css('.header7')

      company.rating = info.text
      company.save
    rescue
      return nil
    end    
  end

  def self.create_jobs(company_name, company)
    begin
      link_careers = open("https://www.linkedin.com/company/#{company_name}/careers")

      doc_careers = Nokogiri::HTML(link_careers)

      jobs = doc_careers.css('.extra .jobs ul li a')

      jobs.each do |job|
        job_doc = Nokogiri::HTML(open(job["href"].gsub('http', 'https')))
        
        description =  job_doc.css('.description-section div').to_s

        company_name = job_doc.css('.company span').text

        name = job_doc.css('.left-entity h1 span').text

        title = job_doc.css('h1.title').text

        location = job_doc.css('.sub-header span span').text

        job_details = {
              name: title,
              description: description,
              location: location
          }
        job = company.jobs.build(job_details)
      end
    rescue
      begin
        link = open("https://angel.co/#{company_name}/jobs")

        doc = Nokogiri::HTML(link)

        jobs = doc.css(".listings.items > div")

        jobs.each do |job|
          job_doc = Nokogiri::HTML(open(job["data-job_url"]))
          description =  job_doc.css(".description-info").to_s
          location = job_doc.css('.locations').text
          title = job_doc.css('.g-title2').text

          job_details = {
                name: title,
                description: description,
                location: location
            }
          job = company.jobs.build(job_details)
        end
      rescue
        nil
      end
    end
    company.save
  end

  def save_lat_long
    if self.latitude.nil?
      latlong = self.geocode
      if latlong
        self.latitude = latlong[0]
        self.longitude = latlong[1]
      end
    end
  end
end
