package airdnd.vo;

public class AmenityVO {
	int amen_id;
	int accom_id;
	String amenity_type;
	String amenity_value;
	
	public AmenityVO()
	{
		
	}

	@Override
	public String toString() {
		return "AmenityVO [amen_id=" + amen_id + ", accom_id=" + accom_id + ", amenity_type=" + amenity_type + 
				", amenity_value=" + amenity_value + "]";
	}

	public int getAmen_id() {
		return amen_id;
	}


	public AmenityVO(int accom_id, String amenity_type, String amenity_value) {
		super();
		this.amen_id = -1; //dummy, DB fill it by Sequence : AMEN_ID_AUTOINC
		this.accom_id = accom_id;
		this.amenity_type = amenity_type;
		this.amenity_value = amenity_value;
	}

	public String getAmenity_value() {
		return amenity_value;
	}

	public void setAmenity_value(String amenity_value) {
		this.amenity_value = amenity_value;
	}

	public int getAccom_id() {
		return accom_id;
	}

	public void setAccom_id(int accom_id) {
		this.accom_id = accom_id;
	}

	public String getAmenity_type() {
		return amenity_type;
	}

	public void setAmenity_type(String amenity_type) {
		this.amenity_type = amenity_type;
	}
	
	
}
