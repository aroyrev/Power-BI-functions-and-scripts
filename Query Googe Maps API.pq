(Location)=>
let
    Source = Json.Document(Web.Contents("https://maps.googleapis.com/maps/api/geocode/json?address="&Location&"&key=&GMAPIKey")),
    results = Source[results],
    #"Converted to Table" = Table.FromList(results, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Expanded Column1" = Table.ExpandRecordColumn(#"Converted to Table", "Column1", {"address_components", "formatted_address", "geometry", "place_id", "types"}, {"address_components", "formatted_address", "geometry", "place_id", "types"}),
    #"Expanded geometry" = Table.ExpandRecordColumn(#"Expanded Column1", "geometry", {"bounds", "location", "location_type", "viewport"}, {"bounds", "location", "location_type", "viewport"}),
    #"Expanded location" = Table.ExpandRecordColumn(#"Expanded geometry", "location", {"lat", "lng"}, {"lat", "lng"}),
    #"Removed Columns" = Table.RemoveColumns(#"Expanded location",{"bounds", "address_components", "viewport", "location_type", "place_id", "types"})
in
    #"Removed Columns"
    
    
    
    
 
