package airdnd.vo;

public class ImageVO {
	int image_id;
	int accom_id;
	String path;
	
	public ImageVO()
	{
		
	}

	public int getAccom_id() {
		return accom_id;
	}

	public void setAccom_id(int accom_id) {
		this.accom_id = accom_id;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getImage_id() {
		return image_id;
	}

	@Override
	public String toString() {
		return "ImageVO [image_id=" + image_id + ", accom_id=" + accom_id + ", path=" + path + "]";
	}

	public ImageVO(int accom_id, String path) {
		super();
		this.image_id = -1; // dummy, DB fill it by Sequence : IMAGE_ID_AUTOINC
		this.accom_id = accom_id;
		this.path = path;
	}
	
	
}
