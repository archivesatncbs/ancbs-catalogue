{
  :schema => {
    "$schema" => "http://www.archivesspace.org/archivesspace.json",
    "version" => 1,
    "type" => "object",
    "uri" => "/repositories",
    "properties" => {
      "uri" => {"type" => "string", "required" => false},

      "repo_code" => {"type" => "string", "maxLength" => 255, "ifmissing" => "error", "minLength" => 1},
      "name" => {"type" => "string", "maxLength" => 255, "ifmissing" => "error", "default" => ""},
      "org_code" => {"type" => "string", "maxLength" => 255},
      "parent_institution_name" => {"type" => "string", "maxLength" => 255},
      "address_1" => {"type" => "string", "maxLength" => 255},
      "address_2" => {"type" => "string", "maxLength" => 255},
      "city" => {"type" => "string", "maxLength" => 255},
      "district" => {"type" => "string", "maxLength" => 255},
      "country" => {"type" => "string", "required" => false, "enum" => ["AF", "AX", "AL", "DZ", "AS", "AD", "AO", "AI", "AQ", "AG", "AR", "AM", "AW", "AU", "AT", "AZ", "BS", "BH", "BD", "BB", "BY", "BE", "BZ", "BJ", "BM", "BT", "BO", "BQ", "BA", "BW", "BV", "BR", "IO", "BN", "BG", "BF", "BI", "KH", "CM", "CA", "CV", "KY", "CF", "TD", "CL", "CN", "CX", "CC", "CO", "KM", "CG", "CD", "CK", "CR", "CI", "HR", "CU", "CW", "CY", "CZ", "DK", "DJ", "DM", "DO", "EC", "EG", "SV", "GQ", "ER", "EE", "ET", "FK", "FO", "FJ", "FI", "FR", "GF", "PF", "TF", "GA", "GM", "GE", "DE", "GH", "GI", "GR", "GL", "GD", "GP", "GU", "GT", "GG", "GN", "GW", "GY", "HT", "HM", "VA", "HN", "HK", "HU", "IS", "IN", "ID", "IR", "IQ", "IE", "IM", "IL", "IT", "JM", "JP", "JE", "JO", "KZ", "KE", "KI", "KP", "KR", "KW", "KG", "LA", "LV", "LB", "LS", "LR", "LY", "LI", "LT", "LU", "MO", "MK", "MG", "MW", "MY", "MV", "ML", "MT", "MH", "MQ", "MR", "MU", "YT", "MX", "FM", "MD", "MC", "MN", "ME", "MS", "MA", "MZ", "MM", "NA", "NR", "NP", "NL", "NC", "NZ", "NI", "NE", "NG", "NU", "NF", "MP", "NO", "OM", "PK", "PW", "PS", "PA", "PG", "PY", "PE", "PH", "PN", "PL", "PT", "PR", "QA", "RE", "RO", "RU", "RW", "BL", "SH", "KN", "LC", "MF", "PM", "VC", "WS", "SM", "ST", "SA", "SN", "RS", "SC", "SL", "SG", "SX", "SK", "SI", "SB", "SO", "ZA", "GS", "SS", "ES", "LK", "SD", "SR", "SJ", "SZ", "SE", "CH", "SY", "TW", "TJ", "TZ", "TH", "TL", "TG", "TK", "TO", "TT", "TN", "TR", "TM", "TC", "TV", "UG", "UA", "AE", "GB", "US", "UM", "UY", "UZ", "VU", "VE", "VN", "VG", "VI", "WF", "EH", "YE", "ZM", "ZW"]},
      "post_code" => {"type" => "string", "maxLength" => 255},
      "telephone" => {"type" => "string", "maxLength" => 255},
      "fax" => {"type" => "string", "maxLength" => 255},
      "email" => {"type" => "string", "maxLength" => 255},
      "email_signature" => {"type" => "string", "maxLength" => 255},
      "url" => {"type" => "string", "maxLength" => 255, "pattern" => "\\Ahttps?:\\/\\/[\\\S]+\\z"},
      "image_url" => {"type" => "string", "maxLength" => 255, "pattern" => "\\Ahttps?:\\/\\/[\\\S]+\\z"},
      
      
    },

    "additionalProperties" => false,
  },
}
