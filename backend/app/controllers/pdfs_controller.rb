class PdfsController < ActionController::Base
  def get_model
    @articles = Article.fivebestsellercantitybyuser(params[:id])
  end


  def  show
      get_model
		respond_to do |format|
		    format.html
			format.pdf do
				render pdf: "template", template: "../views/pdfs/template"  
			end
		end
    end



end