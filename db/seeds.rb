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
  first_name: "Bob",
  last_name: "Googes",
  email: "bob@google.com",
  primary_phone: 8017562234,
  secondary_phone: 8048662630,
  title: "HR Manager"
  })

contact2_google = Contact.create({
  first_name: "Sally",
  last_name: "Smarties",
  email: "sally@google.com",
  primary_phone: 5017562234,
  secondary_phone: 9048202630,
  title: "Senior Engineer"
  })

contact3_google = Contact.create({
  first_name: "George",
  last_name: "Smith",
  email: "george@google.com",
  primary_phone: 3017662234,
  secondary_phone: 9073202621,
  title: "Junior Engineer"
  })

google.contacts << [contact1_google, contact2_google, contact3_google]

contact1_wedding_wire = Contact.create({
  first_name: "Sam",
  last_name: "Porter",
  email: "sam@weddingwire.com",
  primary_phone: 3017662234,
  secondary_phone: 2403202621,
  title: "Back-end Developer"
  })

contact2_wedding_wire = Contact.create({
  first_name: "Sean",
  last_name: "Buckley",
  email: "sean@weddingwire.com",
  primary_phone: 3017662234,
  secondary_phone: 2403202621,
  title: "HR Manager"
  })

contact3_wedding_wire = Contact.create({
  first_name: "Oscar",
  last_name: "Rosa",
  email: "oscar@weddingwire.com",
  primary_phone: 3017662234,
  secondary_phone: 2403202621,
  title: "CEO"
  })

wedding_wire.contacts << [contact1_wedding_wire, contact2_wedding_wire, contact3_wedding_wire]

Job.destroy_all

job1_google = Job.create({
  name: "Software Engineer",
  description: "Google's software engineers develop the next-generation technologies that change how millions of users connect, explore, and interact with information and one another. Our ambitions reach far beyond just Search. Our products need to handle information at the the scale of the web. We're looking for ideas from every area of computer science, including information retrieval, artificial intelligence, natural language processing, distributed computing, large-scale system design, networking, security, data compression, and user interface design; the list goes on and is growing every day. As a software engineer, you work on a small team and can switch teams and projects as our fast-paced business grows and evolves. We need our engineers to be versatile and passionate to tackle new problems as we continue to push technology forward.",
  qualifications:"BA/BS in Computer Science or related technical field. Programming experience in one or more of the following languages: C, C++, Java and/or Python.",
  average_pay: 90000,
  location: "Mountain View, CA, USA"
  })

job2_google = Job.create({
  name: "Build and Release Software Engineer",
  description: "How do you release updates and changes to the world's most trafficked sites without users ever noticing a glitch in service? Our Release Engineering team tackles this very challenge. As a member of the team, you work with Software Engineers to ensure our services and products seamlessly move from development through rollout and into production. This requires scripting and coding with an eye toward scalability so that big deployments can be broken down and distributed across multiple data centers. You are a excited by massively complex systems and the challenges that come from working with some of the largest computing systems in the world. From changing the look of Google Search to backend tweaks to our algorithms, we are constantly pushing updates and iterating on all of our products.",
  qualifications:"5 years of software and/or build automation experience.
Programming experience in one of the following; C++, C#, or Java
Coding experience with batch and/or linux shell scripting.
Experience with various CM tools such as Perforce, Git, Jenkins, Maven.",
  average_pay: 120000,
  location: "Mountain View, CA, USA"
  })

google.jobs << [job1_google, job2_google]

job1_wedding_wire = Job.create({
  name: "Ruby On Rails Developer",
  description: "WeddingWire is looking for web hackers and software engineers capable of solving complex non-intuitive problems in a seemingly intuitive manner. You will be working in an innovative (and fast growing!) engineering team.  WeddingWire engineers work in small teams that make a monumental impact on the single most important day of a couple’s life: their wedding day.",
  qualifications:"You are optimistic and innovative, with a positive outlook on tough problems.
You love learning and working in a modern, fast-paced programming environment, utilizing philosophies like test-driven development and continuous delivery to ship at lightspeed pace.
You place a premium on user experience and efficiency. You believe in developing web-based applications in an iterative, incremental fashion with measurable progress.
You are one of the best engineers you know. But you do know others and like being paid referral bonuses for getting jobs for your friends.",
  average_pay: 93082,
  location: "Chevy Chase, MD"
  })

job2_wedding_wire = Job.create({
  name: "DevOps Engineer",
  description: "WeddingWire is looking for DevOps ninjas capable of solving complex non-intuitive problems in a seemingly intuitive manner. You will be working in an innovative (and fast growing!) engineering team.  WeddingWire engineers work in small teams that make a monumental impact on the single most important day of a couple’s life: their wedding day.",
  qualifications:"You are optimistic and innovative, with a positive outlook on tough problems.
You love the command line and have mastery over Git, Chef (or similar tool), Unix/Linux shell scripting, and Amazon Web Services (EC2, S3, CloudFront).
You are a fast learner and have some experience with Ruby, Unicorn, Nginx, SQL, Faye, and F5/BigIP.
You thrive making deployments happen smoothly, automatically, and repeatedly, across a variety of environments for a plethora of components and applications.
You watch infrastructure like a hawk and jump at the opportunity to diagnose complex issues or improve system performance.
You are one of the best engineers you know. But you do know others and like being paid referral bonuses for getting jobs for your friends",
  average_pay: 130000,
  location: "Chevy Chase, MD"
  })

wedding_wire.jobs << [job1_wedding_wire, job2_wedding_wire]

job1_i_strategy_labs = Job.create({
  name: "Full-stack Developer",
  description: "ISL is looking for a full-stack developer to join our eleven-person, in-house engineering team. You’ll lead the planning and development of tools and applications that power digital campaigns for some of the biggest brands in the world, using the best technology for the job. You’ll push the envelope and you’ll have fun doing it.
We’re looking for someone who can hand-code clean, semantic, standards-compliant HTML5 and CSS3. We want someone with experience building custom themes and plugins for WordPress who is ready to use custom PHP in order to bend WordPress to do your bidding. You should know when to solve a problem with the front-end and when to leave it to the back-end and understand that the best solution varies client to client.",
  qualifications:"Understands the best-practices in responsive design.
Is a thoughtful, independent, forward-thinking developer who wants to be involved throughout the entirety of a project's lifecycle.
Specializes in the understanding development needs across the front-end and back-end.
Is looking to help inspire, build, and learn from a team that strives for the best possible quality in our work.",
  average_pay: 82082,
  location: "Washington, D.C"
  })

i_strategy_labs.jobs << job1_i_strategy_labs