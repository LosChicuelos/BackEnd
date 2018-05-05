# Preview all emails at http://localhost:3000/rails/mailers/new_question_mailer
class NewQuestionMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_question_mailer/notify
  def notify
    NewQuestionMailer.notify Question.first
  end

end
