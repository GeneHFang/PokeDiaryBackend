class Api::V1::TrainersController < ApplicationController
    before_action :set_trainer, only: [:show, :update, :destroy]

    def index
        trainers = Trainer.all
        render json: Api::V1::TrainerSerializer.new(trainers)
    end

    def create
        trainer = Trainer.find_or_create_by(trainer_params)

        if trainer.valid?
            render json: Api::V1::TrainerSerializer.new(trainer)
        else
            render json: trainer.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: Api::V1::TrainerSerializer.new(@trainer)
    end

    def update
        @trainer = Trainer.assign_attributes(trainer_params)

        if @trainer.save
            render json: Api::V1::TrainerSerializer.new(@trainer)
        else 
            render json: @trainer.errors, status: :unprocessable_entity
        end
    end

    def destroy
        trainer = @trainer.destroy

        render json: Api::V1::TrainerSerializer.new(trainer)
    end

    private

    def set_trainer
        @trainer = Trainer.find params[:id]
    end

    def trainer_params
        params.require(:trainer).permit(:name)
    end

end