# Morgan Batterham - T2A2

## Raspberry Pi Marketplace - Two Way Marketplace built on Ruby on Rails

Available live at https://pi-marketplace.herokuapp.com

Github repo - https://github.com/MorganBat/pi-marketplace

### R7 - Identification of the problem you are trying to solve by building this particular marketplace app.

Raspberry Pis are an incredibly popular micro computer used for a wide array of projects. There is a variety of models available with different hardware configurations and capabilities. Additionally, a wide variety of software can be installed.

### R8 - Why is it a problem that needs solving?

There are two main problems being solved here:

1. People may have Raspberry Pis they are no longer using, so they may wish to sell them. At the other end is people who are happy to buy a second hand raspberry pi, especially if an older model has a certain plug (HDMI, micro-usb etc.) which has been phased out of the newer models.

2. Some software can be quite difficult to setup. Some users may not have the knowledge required to install and setup a certain package, or may be time poor and willing to pay for a raspberry pi with pre installed software.

### R11 - Description of your marketplace app

#### Purpose:
The purpose of this website is to facilitate the trade of second hand Raspberry Pis between sellers and buyers. In some cases the Raspberry pi may come with pre installed software.

#### Functionality/Features:
**Accounts:**
The first step to use the website is to register a user account. Pi Marketplace doesn't differentiate between Buyer and Seller accounts, the same account is used for both. Once an account is registered and verified then the user can list a Raspberry for Sale, or purchase a Raspberry Pi listed on the site. 

**Listings:**
The main page of the website lists all of the Raspberry Pis currently for sale. From here a user can create a new listing, edit or delete their own listings, or go through to view more information about any listing.

When the user clicks through to access more information (including a photo) they will have the option to purchase the Raspberry pi, wuth payment being handled by Stripe.

**Stripe Integration:**
If the user is on a listing page that was not created by them, they have the option to purchase the Raspberry pi. Payments are handled by Stripe, and upon successful completion of the transaction that are returned back to the website.

#### Sitemap

#### Screenshots

#### Target Audience

#### Tech Stack

**Front End:** HTML, CSS, Embedded Ruby, Bootstrap, Javascript

**Back End:** Ruby, Ruby on Rails

**Additional Gems:** Devise, Stripe, AWS S3, Ultrahook, Faker

**Database:** PostgreSQL

**Deployment:** Heroku

**Version Control:** Git, GitHub

### R12 - User Stories

1. As a seller, I wish to be able to sell old Raspberry pis that I am no longer using.

2. As a seller, I wish to be able to sell raspberry pis with different software installed as a value add.

3. As a buyer, I wish to be able to buy second hand Raspberry Pis as they will be cheaper.

4. As a buyer, I may wish to purchase a Raspberry pi with pre installed software to save myself time or because I lack the technical skills to configure the pi.

### R13 - Wireframes

### R14 - Entity Relationship Diagram

### R15 - Explain the different high-level components (abstractions) in your app

Pi Marketplace is built on Ruby on Rails, a web framework which utilises the Model/View/Controller (MVC) architecture. 

**Model:** The model handles the interface with the Database for the purpose of storing long term data. In this application I used a PostgreSQL database.

**Controller:** The controller is the interface between the model and the view. The controller passes information between them as required, and contains the majority of the logic used in the app.

**View:** The view is what's displayed to the end user. It uses HTML, CSS and Embedded Ruby to display information provided by the controller.



### R16 - Detail any third party services that your app will use

Heroku: Heroku is a cloud hosting provider designed specifically for the hosting of web apps. It allows a user to deploy their Rails app through a Command Line Interface which utilises Git commands to upload the source files.

AWS S3: AWS (Amazon Web Services) S3 (Simple Storage Service) is a cloud hosting web platform. In this app I have used a S3 bucket to host user uploaded images. This uses the 'aws-s3' gem. Credentials are stored in ```config/credentials.ymc.enc``` which is decrypted by the master key stored in ```config/master.key```

Stripe: Stripe is an online payment processor. Uses the 'stripe' gem. Stripe completely handles credit card payments on their website. Stripe also offers a comprehensive dashboard that tracks payment statistics such as Gross Volume, New Customers, Spend per customer and many more. It also offers a RESTful API and a Webhook service for integrating receipt handling into your web app.

Devise: Devise is a user authentication platform built for Ruby on Rails. Uses the 'devise' gem. Devise handles users signing up for and logging into their profiles.

Faker: Faker is a gem used to generate fake information. In this application it is used to seed the database with 'fake' data for testing purposes.

PostgreSQL: PostgreSQL is a relational database management system. In this application it is used for the long term storage of user data and their associated listings.

Ultrahook: Ultrahook is a web based Webhook platform. In this application it is used for testing Stripe's payment webhook. Ultrahook is designed to forward webhook requests, which is very useful when running the application on a local computer for testing.

### R17 - Describe your projects models in terms of the relationships (active record associations) they have with each other

### R18 - Discuss the database relations to be implemented in your application

### R19 - Provide your database schema design

### R20 - Describe the way tasks are allocated and tracked in your project