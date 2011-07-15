require 'data.rb'

def to_seconds(time)
  return time.scan(/(\d*)h(\d*)m(\d*)s/).collect { |h, min, s| s.to_i + (min.to_i*60)+(h.to_i*60*60)}.first
end

def common_cost(line,opt)
  sum = 0
  countries = line.map{ |l| l['country'] }.uniq

  countries.each{ |country|
    
    mobile_and_phone = line.select { |l|
      (l['type']=='mobile'|| l['type']=='phone') && l['country']==country
    }.map{ |l|{'s'=>to_seconds(l['time']),'#'=>l['#']} 
    }.inject({'s'=>0,'#'=>0}){ |s, l| 
      {'s'=>s['s']+l['s'],'#'=>s['#']+l['#']}
    }
    
    sum += mobile_and_phone['#']*opt[country]["opening"] 
    sum += (mobile_and_phone['s']/60.0)*opt[country]["minute"] 

    sms = line.select { |l|
      l['type']=='sms' && l['country']==country
    }.map{ |l| l['#'] }.inject(:+)
    sms ||= 0
    sum += sms*opt[country]["sms"]
    
    mms = line.select { |l|
      l['type']=='mms' && l['country']==country
    }.map{ |l| l['#'] }.inject(:+) 
    mms ||= 0
    sum += mms*opt[country]["mms"]
  }
  
  return sum
end

@@telia_gr_cost={'opening'=>0.36,'minute'=>3.96,'sms'=>1.5,'mms'=>1.99}

def cost_telia_prata_pa(line)
  return 98.0+common_cost(line,{
    'sv'=>{'opening'=>0.79,'minute'=>0.29,'sms'=>0.29,'mms'=>1.99},
    'gr'=>@@telia_gr_cost,
    })
end

def cost_telia_till_vanner(line)
  return 98.0+common_cost(line,{
    'sv'=>{'opening'=>0.69,'minute'=>0.69,'sms'=>0.69,'mms'=>1.99},
    'gr'=>@@telia_gr_cost,
    })
end

def cost_comviq_smart_69(line)
  return common_cost(line, {
    'sv'=>{'opening'=>0.99,'minute'=>0.19,'sms'=>0.69,'mms'=>0.69},
    'gr'=>{'opening'=>0.99,'minute'=>3.45,'sms'=>0.69,'mms'=>80}
    }) + 3.0*5.0*4.5
end

def cost_comviq_smart_169(line)
  return common_cost(line,  {
    'sv'=>{'opening'=>0.99,'minute'=>0.19,'sms'=>0.0,'mms'=>0.69},
    'gr'=>{'opening'=>0.99,'minute'=>3.45,'sms'=>0.69,'mms'=>80}
    })
end

def halebob(line)
  return 149.0+common_cost(line,{
      'sv'=>{'opening'=>0.69,'minute'=>0.19,'sms'=>0.0,'mms'=>1.99},
      'gr'=>{'opening'=>0.36,'minute'=>3.47,'sms'=>1.5,'mms'=>80},
    })
end

samtal = Samtal.new().get
p "cost_telia_prata_pa"
samtal.each{ |k,v|
  p "#{k} = #{cost_telia_prata_pa(v)}"
}
p "cost_telia_till_vanner"
samtal.each{ |k,v|
  p "#{k} = #{cost_telia_till_vanner(v)}"
}
p "cost_comviq_smart_69"
samtal.each{ |k,v|
  p "#{k} = #{cost_comviq_smart_69(v)}"
}
p "cost_comviq_smart_169"
samtal.each{ |k,v|
  p "#{k} = #{cost_comviq_smart_169(v)}"
}
p "halebob"
samtal.each{ |k,v|
  p "#{k} = #{halebob(v)}"
}
