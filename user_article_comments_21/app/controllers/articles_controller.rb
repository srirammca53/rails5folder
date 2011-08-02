class ArticlesController < ApplicationController
uses_tiny_mce(:options => AppConfig.default_mce_options, :only => [:new, :edit])
def index
 @user = User.find(2)
 @article = @user.articles
 end
 
def new
    @user = User.find(2)
    @article = @user.articles.new
     render :action => "new"
  end
  
def create
    @user = User.find(params[:user_id])
   

    @article = @user.articles.create(params[:article])
    @image = handle_uploaded_image params[:image]

  respond_to do |format|

    if @image.save

      format.js do

        responds_to_parent do

          render :update do |page|

            page << "ts_insert_image('#{@image.public_filename()}', '#{@image.name}');"

          end

        end

      end

    else

      format.js do

        responds_to_parent do

          render :update do |page|

            page.alert('sorry, error uploading image')

          end

        end

      end

    end

  end
    render :action => "show"
    
     end
     
def show
    @user = User.find(2)
    @article = @user.articles.find(params[:id])
    render :action => "show"
  end


 
 
  def update
    @user = User.find(params[:id])
    @article = @user.articles.find(params[:id])
      if @user.articles.update_attributes(params[:article])
        redirect_to(@articles, :notice => 'article was successfully updated.')   
      else
        render :action => "edit" 
      
      
    end
  end
  
def destroy
    @user = User.find(params[:user_id])
    @article = @user.articles.find(params[:id])
    @article.destroy
    redirect_to(articles_url)
  end

end
