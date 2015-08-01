class ErrorsController < ActionController::Base
  allow_cors :not_found, :exception
  def not_found
    respond_to do |f|
      f.json { render :json => {:error => "not-found"}.to_json, :status => 404 }
      f.html { render :text => "404 Not found", :status => 404 }
    end
  end

  def exception
    respond_to do |f|
      f.json { render :json => {:error => "internal-server-error"}.to_json, :status => 500 }
      f.html { render :text => "500 Internal Server Error", :status => 500 }
    end
  end
end