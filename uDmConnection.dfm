object dmConnection: TdmConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 171
  Width = 274
  object FDConnection1: TFDConnection
    ConnectionName = 'C:\Clientes\dbCliente.sdb'
    Params.Strings = (
      'Database=C:\Clientes\dbClient.sdb'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    DriverID = 'SQLite'
    VendorHome = 'C:\Clientes'
    VendorLib = 'C:\Clientes\sqlite3.dll'
    Left = 160
    Top = 40
  end
  object fdqSearch: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM clientes cl'
      '      ')
    Left = 56
    Top = 112
    object fdqSearchid: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      DisplayFormat = '0000'
      EditFormat = '0000'
    end
    object fdqSearchname: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'name'
      Origin = 'name'
      Size = 200
    end
    object fdqSearchaddress: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'address'
      Origin = 'address'
      Size = 200
    end
    object fdqSearchnumber: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'number'
      Origin = 'number'
      Size = 50
    end
    object fdqSearchdistrict: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'district'
      Origin = 'district'
      Size = 100
    end
    object fdqSearchcity: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'city'
      Origin = 'city'
      Size = 150
    end
    object fdqSearchstate: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'state'
      Origin = 'state'
      FixedChar = True
      Size = 2
    end
    object fdqSearchzip: TStringField
      DisplayLabel = 'CEP'
      FieldName = 'zip'
      Origin = 'zip'
      EditMask = '00.000\-999;0;_'
      FixedChar = True
      Size = 10
    end
    object fdqSearchcountry: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'country'
      Origin = 'country'
      Size = 100
    end
    object fdqSearchphone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'phone'
      Origin = 'phone'
      EditMask = '!\(99\) 0.0000-0000;0;_'
    end
    object fdqSearchtype: TStringField
      DisplayLabel = 'Tipo Pessoa'
      FieldName = 'type'
      Origin = 'type'
      OnGetText = fdqSearchtypeGetText
      FixedChar = True
      Size = 1
    end
    object fdqSearchcpf_cnpj: TStringField
      FieldName = 'cpf_cnpj'
      Origin = 'cpf_cnpj'
      OnGetText = fdqSearchcpf_cnpjGetText
    end
    object fdqSearchrg_ie: TStringField
      FieldName = 'rg_ie'
      Origin = 'rg_ie'
    end
    object fdqSearchdata_cadastro: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      EditMask = '!99/99/0000;1; '
    end
    object fdqSearchativo: TBooleanField
      DisplayLabel = 'Ativo'
      FieldName = 'ativo'
      Origin = 'ativo'
      OnGetText = fdqSearchativoGetText
    end
  end
  object fdtClient: TFDTable
    BeforePost = fdtClientBeforePost
    IndexFieldNames = 'id'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'clientes'
    TableName = 'clientes'
    Left = 160
    Top = 112
    object fdtClientid: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      DisplayFormat = '0000'
      EditFormat = '0000'
    end
    object fdtClientname: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'name'
      Origin = 'name'
      Size = 200
    end
    object fdtClientaddress: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'address'
      Origin = 'address'
      Size = 200
    end
    object fdtClientnumber: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'number'
      Origin = 'number'
      Size = 50
    end
    object fdtClientdistrict: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'district'
      Origin = 'district'
      Size = 100
    end
    object fdtClientcity: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'city'
      Origin = 'city'
      Size = 150
    end
    object fdtClientstate: TStringField
      DisplayLabel = 'Estado'
      FieldName = 'state'
      Origin = 'state'
      FixedChar = True
      Size = 2
    end
    object fdtClientzip: TStringField
      DisplayLabel = 'CEP'
      DisplayWidth = 10
      FieldName = 'zip'
      Origin = 'zip'
      EditMask = '00.000\-999;0;_'
      FixedChar = True
      Size = 10
    end
    object fdtClientcountry: TStringField
      DisplayLabel = 'Pa'#237's'
      FieldName = 'country'
      Origin = 'country'
      Size = 100
    end
    object fdtClientphone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'phone'
      Origin = 'phone'
      EditMask = '!\(99\) 0.0000-0000;0;_'
    end
    object fdtClienttype: TStringField
      DisplayLabel = 'Tipo'
      FieldName = 'type'
      Origin = 'type'
      FixedChar = True
      Size = 1
    end
    object fdtClientcpf_cnpj: TStringField
      FieldName = 'cpf_cnpj'
      Origin = 'cpf_cnpj'
    end
    object fdtClientrg_ie: TStringField
      FieldName = 'rg_ie'
      Origin = 'rg_ie'
    end
    object fdtClientdata_cadastro: TDateField
      DisplayLabel = 'Data DCdastro'
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      EditMask = '!99/99/0000;1; '
    end
    object fdtClientativo: TBooleanField
      DisplayLabel = 'Ativo'
      FieldName = 'ativo'
      Origin = 'ativo'
    end
  end
end
