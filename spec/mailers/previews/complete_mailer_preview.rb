# Preview all emails at http://localhost:3000/rails/mailers/complete_mailer
class CompleteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/complete_mailer/complete_mail
  def complete_mail
    CompleteMailer.complete_mail(Complete.new(title:"テスト",description:"プレビュー テスト",email:'自身のメールアドレス'))
  end
end