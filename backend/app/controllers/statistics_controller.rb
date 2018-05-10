class StatisticsController < ApplicationController
    
    def get_model
        
        @articles = Article.belongsuserid(params[:iduser]).higher_price_than(params[:max_price]).lower_price_than(params[:min_price]).created_before(params[:start_date]).created_after(params[:ending_date]).group_month.count.to_a
        #@articles = Article.belongsuserid(1).higher_price_than(nil).lower_price_than(nil).created_before(nil).created_after(nil).group_month.count.to_a
        g = Gruff::Line.new
        g.title = 'Estos son los articulos que has publicado por mes'
        
        g.labels = {}
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
        g.write('exciting.png')
    end


    def  show
      #get_model
		  respond_to do |format|
		      #format.html
			    format.pdf do
				    render pdf: "template", template: "../views/pdfs/template_statistics"  
			end
	    end
    end
end
