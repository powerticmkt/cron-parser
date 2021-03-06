class Cron::Parser
  class DayOfMonthField < Field
    def self.allowed_values; ("1".."9").to_a + ("01".."31").to_a   end
    def self.upper_bound;                self.allowed_values.last  end
    def self.lower_bound;                self.allowed_values.first end
    def self.allowed_special_characters; %w{ * / , - }             end
    def self.specifications
      super
    end

    # Creates partial meaning (sentence) for the day of month field's pattern.
    def self.generate_meaning(list, unit)
      meaning = ""
      meaning += self.field_preposition(unit)
      meaning += " days: "
      meaning += list.map(&:to_s).map(&:ordinalize).join(", ")
      meaning
    end
  end
end
