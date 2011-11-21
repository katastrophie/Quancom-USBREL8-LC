module Webapp
  class RoutesScripts < MainWebApp

    # == FORMS

    get '/form' do
      @script = Script.new
      haml :script_edit
    end

    get '/form/:id' do
      @script = Script.get params[:id]
      haml :script_edit
    end

    get '/form/delete/:id' do
      @script = Script.get params[:id]
      haml :script_delete
    end

    # == ACTIONS

    post '/' do
      if params[:submit] == 'Submit'
        @script = Script.new
        @script.name = params[:script][:name]
        @script.text = params[:script][:text]
        @script.created_at = Time.now
        @script.save
        set_message "successfully created script #{@script.id}.", 'success'
      end
      redirect '/'
    end

    post '/:id' do
      if params[:submit] == 'Submit'
        @script = Script.get params[:id]
        @script.name = params[:script][:name]
        @script.text = params[:script][:text]
        @script.created_at = Time.now
        @script.save
        set_message "successfully updated script #{@script.id}."
      end
      redirect '/'
    end

    #delete '/script/:id' do
    post '/delete/:id' do
      if params[:submit] == 'Submit'
        @script = Script.get params[:id]
        @script.destroy
        set_message "successfully deleted script #{params[:id]}."
      end
      redirect '/'
    end

    # not needed, same as index
    #get '/script' do
    #  haml :script_list
    #end
  end
end