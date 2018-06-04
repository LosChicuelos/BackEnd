#Esta clase envía un email de advertencia a un usuario cunado es necesario.

class WarningMailer < ApplicationMailer

  #En este metodo recibimos el usuario al que se le enviara el email.
  def notify(user)
    
    @user = user
		mail to: @user.email, subject: 'Correo de notoficacion del equipo de Campo a la Mano.'
		
  end
  
  #En este metodo recibimos el email al que se le enviara la informacion.
  def notifyEmail(email)
    
    @email = email
		mail to: @email, subject: 'Correo de notoficacion del equipo de Campo a la Mano.'
		
  end
end
