#Esta clase envía un email por fallo de autentificacion.
class AuthenticationFailure < ApplicationMailer

	#Clase que recibe el usuario y le envía el mensaje.
	def notify_user(user)

		@user = user
		mail(to: @user.email, subject: 'La cuenta ha sido bloqueada por exceso de intentos de autentificacion.', body: 'something')
	
	end
end