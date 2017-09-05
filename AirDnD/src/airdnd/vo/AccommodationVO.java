package airdnd.vo;

public class AccommodationVO {
	public AccommodationVO(int accom_id, int accomodates, int bathrooms, int bedrooms, int beds, String building_type,
			String currency_unit, String description, String host_id, String location, String name, float price,
			String property_type, String room_type, float avg_point) {
		super();
		this.accom_id = accom_id;
		this.accomodates = accomodates;
		this.bathrooms = bathrooms;
		this.bedrooms = bedrooms;
		this.beds = beds;
		this.building_type = building_type;
		this.currency_unit = currency_unit;
		this.description = description;
		this.host_id = host_id;
		this.location = location;
		this.name = name;
		this.price = price;
		this.property_type = property_type;
		this.room_type = room_type;
		this.avg_point = avg_point;
	}



	int accom_id;
	int accomodates;
	int bathrooms;
	int bedrooms;
	int beds;
	String building_type;

	String currency_unit;
	String description;
	String host_id;
	String location;
	String name;
	float price;
	String property_type;
	String room_type;
	float avg_point;
	
	public AccommodationVO()
	{

	}




	public AccommodationVO(int accomodates, int bathrooms, int bedrooms, int beds, String building_type,
			String currency_unit, String description, String host_id, String location, String name, float price,
			String property_type, String room_type) {
		super();
		this.accom_id = -1; // 
		this.accomodates = accomodates;
		this.bathrooms = bathrooms;
		this.bedrooms = bedrooms;
		this.beds = beds;
		this.building_type = building_type;
		this.currency_unit = currency_unit;
		this.description = description;
		this.host_id = host_id;
		this.location = location;
		this.name = name;
		this.price = price;
		this.property_type = property_type;
		this.room_type = room_type;
		this.avg_point = 0.0f;
	}




	public Integer getAccom_id() {
		return accom_id;
	}



	public void setAccom_id(Integer accom_id) {
		this.accom_id = accom_id;
	}



	public String getRoom_type() {
		return room_type;
	}



	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}



	public Integer getAccomodates() {
		return accomodates;
	}



	public void setAccomodates(Integer accomodates) {
		this.accomodates = accomodates;
	}



	public String getProperty_type() {
		return property_type;
	}



	public void setProperty_type(String property_type) {
		this.property_type = property_type;
	}



	public String getBuilding_type() {
		return building_type;
	}



	public void setBuilding_type(String building_type) {
		this.building_type = building_type;
	}



	public Integer getBedrooms() {
		return bedrooms;
	}



	public void setBedrooms(Integer bedrooms) {
		this.bedrooms = bedrooms;
	}



	public Integer getBeds() {
		return beds;
	}



	public void setBeds(Integer beds) {
		this.beds = beds;
	}



	public Integer getBathrooms() {
		return bathrooms;
	}



	public void setBathrooms(Integer bathrooms) {
		this.bathrooms = bathrooms;
	}





	public String getLocation() {
		return location;
	}



	public void setLocation(String location) {
		this.location = location;
	}



	public String getCurrency_unit() {
		return currency_unit;
	}



	public void setCurrency_unit(String currency_unit) {
		this.currency_unit = currency_unit;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getHost_id() {
		return host_id;
	}



	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public float getPrice() {
		return price;
	}



	public void setPrice(float price) {
		this.price = price;
	}



	public float getAvg_point() {
		return avg_point;
	}



	public void setAvg_point(float avg_point) {
		this.avg_point = avg_point;
	}



	public void setAccom_id(int accom_id) {
		this.accom_id = accom_id;
	}



	public void setAccomodates(int accomodates) {
		this.accomodates = accomodates;
	}



	public void setBathrooms(int bathrooms) {
		this.bathrooms = bathrooms;
	}



	public void setBedrooms(int bedrooms) {
		this.bedrooms = bedrooms;
	}



	public void setBeds(int beds) {
		this.beds = beds;
	}


	
	
	
}