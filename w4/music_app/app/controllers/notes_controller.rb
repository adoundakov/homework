class NotesController < ApplicationController

  before_action :logged_in?

  def create
    note_pars = {
            track_id: params[:track_id],
            user_id: current_user.id,
            body: note_params[:body]
          }

    @note = Note.new(note_pars)

    if @note.save
      flash[:success] = "note created successfully!"
      redirect_to track_url(params[:track_id])
    else
      flash[:errors] = ['There was an error creating your note, please try again.']
      redirect_to track_url(params[:track_id])
    end
  end

  def destroy
    @note = Note.find(params[:id])
    if !(current_user == @note.user || current_user.admin)
      flash[:errors] = ["Nuh Uh! Stop hacking the site."]
      redirect_to track_url(@note.track_id)
    elsif @note.destroy
      flash[:success] = 'Note deleted successfully'
      redirect_to track_url(@note.track_id)
    else
      flash[:errors] = 'Error deleting note, please try again'
      redirect_to track_url(@note.track_id)
    end
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
