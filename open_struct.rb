# -*- encoding : utf-8 -*-
# monkeypatch openstruct to get the method id working for openstructs
# which get an id as attribute
OpenStruct.__send__(:define_method, :id) { @table[:id] }
