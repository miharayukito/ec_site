class CompleteMailer < ApplicationMailer
  def complete_mail
    @complete = complete(complete)
    mail to: complete.email, subject: '購入完了のお知らせ'
  end
end