class GeneralMailer < Devise::Mailer

    helper :application # gives access to all helpers defined within `application_helper`.
    include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
    default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

    def confirmation_instructions(record, token, opts={})
      headers["Custom-header"] = "Bienvenue sur le site Resilience Travel of Mango !"
      opts[:from] = 'resiliencetravelofmango@gmail.com'
      super
    end

    def order_to_customer
      @subject = "Bonjour & Merci!"
      if params[:user] && params[:order]
        p "user valid && order exists!"
        @user = params[:user]
        @order = params[:order]
        p "Sending mail now ..."
        mail(to: @user.email, subject: @subject)
        p "Mail to customer sent."
      else
        p "error somewhere!"
      end
    end

    def order_to_admin
      @subject = "Nouvelle commande Mango!‍‍"
      if params[:user] && params[:order]
        p "order exists for a specific user!"
        @user = params[:user]
        @order = params[:order]
        p "Sending mail now ..."
        mail(to: "resiliencetravelofmango@gmail.com", subject: @subject)
        p "Mail to admin sent."
      else
        p "something wrong here!"
      end
    end

end
