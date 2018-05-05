#Esta clase envia un correo al vendedor cuando se realiza una pregunta en uno de sus articulos

class NewQuestionMailer < ApplicationMailer

  #En este metodo recibimos la nueva pregunta y enviamos el email.
  def notify(question)
    
    @question = question
    @iduserseller =  Article.id_user_seller(@question.article_id).first
    @user = User.full_user(@iduserseller.user_id).first
		mail to: @user.email, subject: 'Tienes una nueva pregunta.'
		
  end
  
end
