package airdnd.dao.interfaces;

import java.util.List;

import airdnd.vo.UserVO;

public interface UserDAO {
	// CRUDs
	public UserVO getUser(String userId);
	public List<UserVO> getUserList();
	public int addUser(UserVO user);
	public int removeUser(String userId);
	public int updateUser(UserVO user);
	
	// Functional Methods
	public boolean login(String id, String pw);
}
