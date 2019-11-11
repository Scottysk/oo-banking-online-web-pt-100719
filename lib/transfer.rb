class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end
  
  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= self.amount
      @receiver.balance += self.amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balanced."
    end
  end
  
  
  
  
end
