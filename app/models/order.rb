class Order < ApplicationRecord
has_many :orderItem ,dependent: :destroy 
<<<<<<< HEAD

=======
>>>>>>> bc8c08c94c2131aabe9e2e636a2a398990f1110a
end
