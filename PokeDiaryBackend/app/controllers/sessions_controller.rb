class SessionsController < ApplicationController
    include CurrentTrainerConcern
    def create
        trainer = Trainer
                    .find_by(name: params['trainer']['name'])
                    .try(:authenticate, params['trainer']['password'])

        if trainer
            session[:trainer_id] = trainer.id
            render json: {
                status: :created,
                logged_in: true,
                trainer: trainer
            }

        else
            render json: { status: 401 }
        end

    end
    def logged_in
        if @current_trainer
            render json: {
                logged_in: true,
                trainer: @current_trainer
            }
        else
            render json: {
                logged_in: false
            }
        end
    end

    def logout
        reset_session
        redner json: {
            status: 200, 
            logged_out: true
        }
    end


end
