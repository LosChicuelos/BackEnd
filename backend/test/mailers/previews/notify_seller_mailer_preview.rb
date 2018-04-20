# Preview all emails at http://localhost:3000/rails/mailers/notify_seller_mailer
class NotifySellerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notify_seller_mailer/notify
  def notify
    NotifySellerMailer.notify Sale.first
  end

end
