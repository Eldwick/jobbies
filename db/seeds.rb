Company.destroy_all

google = Company.create({
  name: "Google",
  street_address: "1600 Amphitheatre Pkwy",
  city: "Mountain View",
  state: "California",
  zip_code: 94043 ,
  rating: 4.4,
  num_employees: "5000+",
  category: "Information Technology",
  website: "www.google.com"
  })

wedding_wire = Company.create({
  name: "WeddingWire",
  street_address: "2 Wisconsin Cir #3",
  city: "Chevy Chase",
  state: "Maryland",
  zip_code: 20815,
  rating: 4.7,
  num_employees: "150 to 499",
  category: "Information Technology",
  website: "www.weddingwire.com"
  })

cvent = Company.create({
  name: "Cvent",
  street_address: "1765 Greensboro Station Pl",
  city: "Tysons Corner",
  state: "Virginia",
  zip_code: 22102,
  rating: 4.0,
  num_employees: "1000 to 5000",
  category: "Information Technology",
  website: "www.cvent.com"
  })

i_strategy_labs = Company.create({
  name: "iStrategyLabs",
  street_address: "1630 Connecticut Ave NW",
  city: "Washington, D.C.",
  state: "Washington, D.C.",
  zip_code: 20009,
  rating: 3.4,
  num_employees: "50 to 149",
  category: "Business Services",
  website: "www.istrategylabs.com"
  })

threespot = Company.create({
  name: "Threespot Media",
  street_address: "3333 14th St NW",
  city: "Washington, D.C.",
  state: "Washington, D.C.",
  zip_code: 20010,
  rating: 3.9,
  num_employees: "1000 to 5000",
  category: "Information Technology",
  website: 'www.threespot.com'
  })

Contact.destroy_all

contact1_google = Contact.create({
  name: "Bob Googes",
  email: "bob@google.com",
  primary_phone: 8017562234,
  secondary_phone: 8048662630,
  title: "HR Manager"
  })

contact2_google = Contact.create({
  name: "Sally Jacobs",
  email: "sally@google.com",
  primary_phone: 5017562234,
  secondary_phone: 9048202630,
  title: "Senior Engineer"
  })

google.contacts << [contact1_google, contact2_google]