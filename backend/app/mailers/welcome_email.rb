#Esta clase envía un email de bienvenida a usuarios nuevos.
class WelcomeEmail < ApplicationMailer

	#Clase que recibe el usuario y le envía el mensaje.
	def notify_user(user)
		@user = user
		mail(to @user.email, subject: "Bienvenido a la comunidad de Campo a la Mano.")
end