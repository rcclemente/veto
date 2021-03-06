module Veto
	class LengthRangeCheck < AttributeCheck
		def check(attribute, value, errors, options={})
			range = options.fetch(:in)
			inclusion_method = range.respond_to?(:cover?) ? :cover? : :include?
			message = options.fetch(:message, :length_range)
			on = options.fetch(:on, attribute)
			
			if value.nil? || !range.send(inclusion_method, value.length)
				errors.add(on, message)
			end
		end
	end
end