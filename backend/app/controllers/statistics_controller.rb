class StatisticsController < ActionController::Base
    
    def get_model ()
        
        @title = ""
        
        @articles = Article.belongsuserid(params[:iduser]).higher_price_than(params[:max_price]).lower_price_than(params[:min_price]).created_before(params[:start_date]).created_after(params[:ending_date]).group_month.count.to_a
        #@articles = Article.belongsuserid(5).higher_price_than(nil).lower_price_than(nil).created_before(nil).created_after(nil).group_month.count.to_a
        
        #Creamos el gruff
        g = Gruff::Bar.new
        #puts @articles
        
        #En este if evaluamos si hay o no resultados para la consulta
        if @articles.present? == false
          
          #creamos un gruff vacio ya que no tiene articulos
          g.title = 'No tienes articulos publicados'
          g.labels = {}
          g.data :"Articulos publicado", [0]
          g.write('exciting.png')
        else
          
          @title = "Estos son los articulos que has publicado por mes"
          g.title = ''
          
          g.labels = {}
          
          #Asignamos los labels en el eje X
          @articles.each do |data|
            g.labels[data[0].to_i] = data[1].to_s
          end
=begin          
          #puts g.labels
          
          #Asignamos los labels iterando en la cantidad de meses
          # Convert the table to array of hashes
          hashes = @articles.map { |id, val|
            {id => val}
          }

          #puts hashes.values
          # Merge the hashes
          hashes.inject { |h1, h2|
            h1.merge(h2) { |key,old,new|
              (old.is_a?(Array) ? old : [old]) << new
            }
          }
          #puts hashes.values
          #puts @articles
          newarray = @articles.to_a
          newarray = newarray[0].map(&:to_i)
          puts newarray[0]
          
          g.data :"Articulos publicado", newarray[0]
=end      
          #Asignamos el resultado para cada mes a cada label en X
          @articles.each do |data|
            g.data("Mes #{data[0]} : #{data[1]}", data[1])
          end
          g.write('public/images/exciting.png')
        end
        
    end

    #Funcion que renderiza la estadistica de articulos publicados por mes
    def  show
      get_model
		  respond_to do |format|
		      format.html
			    format.pdf {render template: "pdfs/template_statistics", pdf: "template_statistics" }
			end
	    
    end
    
    #En este metodo se genera la estadistica en la imagen public/images/exciting.png
    def get ()
        
        @title = ""

        #En este switch se determina que estadistica realizar
        case params[:idstatistics].to_i # Estadistica solicitada
        
					when 2
					  
					  @score = User.buyer_averange_score(params[:iduser])
		        @scores = Score.buyer_belongsuserid(params[:iduser]).created_before(params[:start_date]).created_after(params[:ending_date]).group_rank.count.to_a
		        #Score.buyer_belongsuserid(1).created_before(nil).created_after(nil).group_rank.count.to_a
		        
		        #Creamos el gruff
		        g = Gruff::Bar.new

		        #En este if evaluamos si hay o no resultados para la consulta
		        if @scores.present? == false
		          
		          #creamos un gruff vacio ya que no tiene articulos
		          g.title = 'No tienes calificaciones como comprador'
		          g.labels = {}
		          g.data :"Sin calificaciones", [0]
		        else
		          @title = "Calificaciones como comprador"
		          g.title = ''
		          g.labels = {}
		          
		          #Asignamos los labels en el eje X
		          @scores.each do |data|
		            g.labels[data[0].to_i] = data[0].to_s
		          end
		          #Asignamos el resultado para cada mes a cada label en X
		          @scores.each do |data|
		            g.data("Notas en #{data[0]} : #{data[1]}", data[1])
		          end
		          
		        end 

					else
					  #Creamos el gruff
		        g = Gruff::Bar.new
		        #creamos un gruff vacio
		        g.title = 'No se encuentran resultados'
		        g.labels = {}
		        g.data :"Sin resultados", [0]
        end
        
        g.write('public/images/exciting.png')
        
    end
    
    
    #Funcion generalizada para renderizar estadisticas
    def  show_all
      get
		  respond_to do |format|
		      format.html
			    format.pdf {render template: "pdfs/template_statistics", pdf: "template_statistics" }
			end
	    
    end
end
