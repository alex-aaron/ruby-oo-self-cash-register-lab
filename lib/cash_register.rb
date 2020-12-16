
class CashRegister
    def initialize(discount = 1)
        @total = 0
        @discount = discount
        @items_array = []
        @last_transaction = 0
    end

    attr_accessor :discount

    attr_accessor :title

    attr_accessor :price

    def total=(total)
        @total = total
    end

    def total
        @total
    end
    
    def add_item(title, price, quantity=1)
        self.total = self.total + (price * quantity)
        @last_transaction = price * quantity
        quantity.times {@items_array << title}
    end

    def apply_discount
        if self.discount == 1
            return "There is no discount to apply."
        else
            discounted_amount = self.total * discount / 100
            self.total = self.total - discounted_amount
            return "After the discount, the total comes to $#{self.total}."
        end
    end

    def items
        @items_array
    end

    def void_last_transaction
        self.total = self.total - @last_transaction
    end

end