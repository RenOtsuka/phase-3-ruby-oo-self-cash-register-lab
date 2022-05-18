require 'pry'
class CashRegister

    attr_accessor :total
    attr_accessor :last_item

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def discount
        @discount
    end

    def add_item(title, price, quantity = 1)
        quantity.times {|i| items << title}
        self.last_item = price
        self.total = total + (price * quantity)
    end

    def apply_discount
        if discount != 0
            self.total = total * ( 1 - discount / 100.0)
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        count = items.filter{|elem| elem == items.last}.length
        self.total = total - (self.last_item * count)
    end

end


