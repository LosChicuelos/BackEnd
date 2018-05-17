class StatisticsController < ActionController::Base
    
    def get_model ()
        
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


    def  show
      get_model
		  respond_to do |format|
		      format.html
			    format.pdf {render template: "pdfs/template_statistics", pdf: "template_statistics" }
			end
	    
    end
end
