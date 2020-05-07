class MQELEM < ApplicationRecord
  belongs_to :mqdiag
  enum tipo_elemento: [:State, :Condition]
  validates :descricao, presence: true, if: :State?
  validates :tipo_elemento, presence: true
  def self.tipo_elementos
    [ ['Estado', 'State'], ['Condição', 'Condition'] ]
  end
  before_destroy :remove_dependencias
  private
  def remove_dependencias
    MQTRAN.where(mqelem_origem_id:  id).delete_all
    MQTRAN.where(mqelem_destino_id: id).delete_all
    mqdiag.update(mqelem_inicial_id: nil) if mqdiag.mqelem_inicial_id == id
    mqdiag.update(mqelem_final_id:   nil) if mqdiag.mqelem_final_id   == id
  end
end
