
class Samtal
  attr_reader :samtal
    
  def initialize()
    @samtal = {
      '20110704'=>[
       {'type'=>'mobile', 'country'=>'sv', 'operator'=>'3', '#'=>12, 'time'=>'0h25m52s'},
       {'type'=>'mobile', 'country'=>'sv', 'operator'=>'other', '#'=>51, 'time'=>'0h168m20s'},
       {'type'=>'phone', 'country'=>'sv', 'operator'=>'other', '#'=>9, 'time'=>'0h71m59s'},
       {'type'=>'mobile', 'country'=>'gr','operator'=>'other', '#'=>14, 'time'=>'0h35m50s'},
       {'type'=>'sms', 'country'=>'gr','operator'=>'other', '#'=>59},
       {'type'=>'sms', 'country'=>'sv', 'operator'=>'other', '#'=>22},
      ],

      '20110610'=>[
       {'type'=>'mobile', 'country'=>'sv', 'operator'=>'3', '#'=>8, 'time'=>'0h21m0s'},
       {'type'=>'mobile', 'country'=>'sv', 'operator'=>'other', '#'=>59, 'time'=>'0h230m00s'},
       {'type'=>'phone', 'country'=>'sv', 'operator'=>'other', '#'=>14, 'time'=>'0h119m0s'},
       {'type'=>'mobile', 'country'=>'gr','operator'=>'other', '#'=>23, 'time'=>'0h40m0s'},
       {'type'=>'sms', 'country'=>'gr','operator'=>'other', '#'=>54},
       {'type'=>'sms', 'country'=>'sv', 'operator'=>'other', '#'=>26},
      ],


      '20110512'=>[
       {'type'=>'mobile', 'country'=>'sv', 'operator'=>'3', '#'=>8, 'time'=>'0h21m0s'},
       {'type'=>'mobile', 'country'=>'sv', 'operator'=>'other', '#'=>73, 'time'=>'0h236m00s'},
       {'type'=>'phone', 'country'=>'sv', 'operator'=>'other', '#'=>9, 'time'=>'0h70m0s'},
       {'type'=>'mobile', 'country'=>'gr','operator'=>'other', '#'=>20, 'time'=>'0h46m0s'},
       {'type'=>'sms', 'country'=>'gr','operator'=>'other', '#'=>29},
       {'type'=>'sms', 'country'=>'sv', 'operator'=>'other', '#'=>32},
      ],
    }
  end
  def get()
    return @samtal
  end
end


