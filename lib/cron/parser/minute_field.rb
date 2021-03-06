class Cron::Parser
  class MinuteField < Field
    def self.allowed_values; ("0".."9").to_a + ("00".."59").to_a   end
    def self.upper_bound;                self.allowed_values.last  end
    def self.lower_bound;                self.allowed_values.first end
    def self.allowed_special_characters; %w{ * / , - }             end
    def self.specifications
      super
    end

    # Creates partial meaning (sentence) for the minute field's pattern.
    def self.generate_meaning(list, unit)
      meaning = ""
      meaning += self.field_preposition(unit)
      meaning += " "
      meaning += list.map(&:to_s).map(&:ordinalize).join(", ")
      meaning += " "
      meaning += unit
      meaning
    end
  end
end
