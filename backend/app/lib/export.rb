require_relative "../../../migrations/lib/exporter"

module ExportHelpers
  
  ASpaceExport::init unless ASpaceExport::initialized?
 
  def xml_response(xml)
    [status, {"Content-Type" => "application/xml"}, [xml + "\n"]]
  end
  
  def tsv_response(tsv)
    [status, {"Content-Type" => "text/tab-separated-values"}, [tsv + "\n"]]
  end

  def generate_labels(id)
    
    obj = resolve_references(Resource.to_jsonmodel(id), ['tree', 'repository'])

    labels = ASpaceExport.model(:labels).from_resource(JSONModel(:resource).new(obj))
    
    ASpaceExport.serializer(:tsv).serialize(labels)

  end


  def generate_dc(id)
    
    obj = resolve_references(DigitalObject.to_jsonmodel(id), ['repository', 'linked_agents', 'subjects'])
    # obj = DigitalObject.get_or_die(id)
    
    dc = ASpaceExport.model(:dc).from_digital_object(JSONModel(:digital_object).new(obj))
    
    ASpaceExport.serializer(:dc).serialize(dc)
  end

  
  def generate_mets(id)
    
    obj = resolve_references(DigitalObject.to_jsonmodel(id), ['repository', 'linked_agents', 'subjects', 'tree'])
    # obj = DigitalObject.get_or_die(id)
    
    mets = ASpaceExport.model(:mets).from_digital_object(JSONModel(:digital_object).new(obj))
    
    ASpaceExport.serializer(:mets).serialize(mets)
  end
  
  
  def generate_mods(id)
    
    obj = resolve_references(DigitalObject.to_jsonmodel(id), ['repository', 'linked_agents', 'subjects', 'tree'])
    # obj = DigitalObject.get_or_die(id)
    
    mods = ASpaceExport.model(:mods).from_digital_object(JSONModel(:digital_object).new(obj))
    
    ASpaceExport.serializer(:mods).serialize(mods)
  end  
  
  def generate_marc(id)
    
    # Maybe we should just have an 'all' for resolve to avoid having to list these...
    obj = resolve_references(Resource.to_jsonmodel(id), ['repository', 'linked_agents', 'subjects'])
    
    marc = ASpaceExport.model(:marc21).from_resource(JSONModel(:resource).new(obj))
    
    ASpaceExport.serializer(:marc21).serialize(marc)
  end
  
  
  def generate_ead(id)

    obj = resolve_references(Resource.to_jsonmodel(id), ['repository', 'linked_agents', 'subjects', 'tree'])
    
    ead = ASpaceExport.model(:ead).from_resource(JSONModel(:resource).new(obj))
    
    ASpaceExport.serializer(:ead).serialize(ead)
    
  end
  
  # TODO - Get this exporter using ExportModels like the entries above...
  def generate_eac(id, type)
    
    agent = Kernel.const_get(type.camelize).get_or_die(id)
    
    serializer = ASpaceExport::serializer(:eac)
    
    serializer.serialize(agent)
  end
  
  
  
end
  
