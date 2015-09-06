# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# -- Spree
unless Spree::Country.find_by_name 'France'
  puts "[db:seed] Seeding Spree"
  Spree::Core::Engine.load_seed if defined?(Spree::Core)
  Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
end

# -- States
unless Spree::State.find_by_name 'PARIS'
  country = Spree::Country.find_by_name('France')
  
  puts "[db:seed] Seeding states for France"

  [
['AIN','ain'],
['AISNE','aisne'],
['ALLIER','allier'],
['HAUTES ALPES','hautesalpes'],
['ALPES DE HAUTE PROVENCE','alpesdehauteprovence'],
['ALPES MARITIMES','alpesmaritimes'],
['ARDECHE','ardeche'],
['ARDENNES','ardennes'],
['ARIEGE','ariege'],
['AUBE','aube'],
['AUDE','aude'],
['AVEYRON','aveyron'],
['BOUCHES DU RHONE','bouchesdurhone'],
['CALVADOS','calvados'],
['CANTAL','cantal'],
['CHARENTE','charente'],
['CHARENTE MARITIME','charentemaritime'],
['CHER','cher'],
['CORREZE','correze'],
['CORSE DU SUD','corsedusud'],
['HAUTE CORSE','hautecorse'],
['COTE D OR','cotedor'],
['COTES D ARMOR','cotesdarmor'],
['CREUSE','creuse'],
['DORDOGNE','dordogne'],
['DOUBS','doubs'],
['DROME','drome'],
['EURE','eure'],
['EURE ET LOIR','eureetloir'],
['FINISTERE','finistere'],
['GARD','gard'],
['HAUTE GARONNE','hautegaronne'],
['GERS','gers'],
['GIRONDE','gironde'],
['HERAULT','herault'],
['ILE ET VILAINE','ileetvilaine'],
['INDRE','indre'],
['INDRE ET LOIRE','indreetloire'],
['ISERE','isere'],
['JURA','jura'],
['LANDES','landes'],
['LOIR ET CHER','loiretcher'],
['LOIRE','loire'],
['HAUTE LOIRE','hauteloire'],
['LOIRE ATLANTIQUE','loireatlantique'],
['LOIRET','loiret'],
['LOT','lot'],
['LOT ET GARONNE','lotetgaronne'],
['LOZERE','lozere'],
['MAINE ET LOIRE','maineetloire'],
['MANCHE','manche'],
['MARNE','marne'],
['HAUTE MARNE','hautemarne'],
['MAYENNE','mayenne'],
['MEURTHE ET MOSELLE','meurtheetmoselle'],
['MEUSE','meuse'],
['MORBIHAN','morbihan'],
['MOSELLE','moselle'],
['NIEVRE','nievre'],
['NORD','nord'],
['OISE','oise'],
['ORNE','orne'],
['PAS DE CALAIS','pasdecalais'],
['PUY DE DOME','puydedome'],
['PYRENEES ATLANTIQUES','pyreneesatlantiques'],
['HAUTES PYRENEES','hautespyrenees'],
['PYRENEES ORIENTALES','pyreneesorientales'],
['BAS RHIN','basrhin'],
['HAUT RHIN','hautrhin'],
['RHONE','rhone'],
['HAUTE SAONE','hautesaone'],
['SAONE ET LOIRE','saoneetloire'],
['SARTHE','sarthe'],
['SAVOIE','savoie'],
['HAUTE SAVOIE','hautesavoie'],
['PARIS','paris'],
['SEINE MARITIME','seinemaritime'],
['SEINE ET MARNE','seineetmarne'],
['YVELINES','yvelines'],
['DEUX SEVRES','deuxsevres'],
['SOMME','somme'],
['TARN','tarn'],
['TARN ET GARONNE','tarnetgaronne'],
['VAR','var'],
['VAUCLUSE','vaucluse'],
['VENDEE','vendee'],
['VIENNE','vienne'],
['HAUTE VIENNE','hautevienne'],
['VOSGES','vosges'],
['YONNE','yonne'],
['TERRITOIRE DE BELFORT','territoiredebelfort'],
['ESSONNE','essonne'],
['HAUTS DE SEINE','hautsdeseine'],
['SEINE SAINT DENIS','seinesaintdenis'],
['VAL DE MARNE','valdemarne'],
['VAL D OISE','valdoise'],
['MAYOTTE','mayotte'],
['GUADELOUPE','guadeloupe'],
['GUYANE','guyane'],
['MARTINIQUE','martinique'],
['REUNION','reunion'],
['SAINT PIERRE ET MIQUELON','saintpierreetmiquelon'],
  ].each do |state|
    Spree::State.create!({"name"=>state[0], "abbr"=>state[1], :country=>country}, :without_protection => true)
  end
end


# -- Seeding suburbs
require_relative './suburb_seeds'
SuburbSeeder.seed_suburbs unless Suburb.find_by_name("PARIS")