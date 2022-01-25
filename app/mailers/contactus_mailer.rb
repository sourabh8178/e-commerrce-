class ContactusMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def contact_mail(contact)
		
    @contact = contact
    @url  = 'http://example.com/login'
    mail(to: @contact.email, subject: @contact.subject)
  end
end

