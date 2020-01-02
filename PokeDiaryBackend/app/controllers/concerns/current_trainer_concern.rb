module CurrentTrainerConcern extend ActiveSupport::Concern

    included do
        before_action :set_current_trainer
    end

    def set_current_trainer
        if session[:trainer_id]
            @current_trainer = Trainer.find(session[:trainer_id])
        end
    end


end
