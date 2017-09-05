package airdnd.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import airdnd.dao.interfaces.UserDAO;
import airdnd.vo.UserVO;

@Repository
public class UserDAOImp implements UserDAO {

	@Autowired
	SqlSession session;
	
	@Override
	public UserVO getUser(String user_Id) {
		return session.selectOne("usersMapper.getUser", user_Id);
	}

	@Override
	public List<UserVO> getUserList() {
		return session.selectList("usersMapper.getUsers");
	}

	@Override
	public int addUser(UserVO user) {
		return session.insert("usersMapper.insertUser", user);
	}
	
	@Override
	public int updateUser(UserVO user) {
		return session.update("usersMapper.updateUser", user);
	}

	@Override
	public int removeUser(String user_Id) {
		return session.delete("usersMapper.deleteUser", user_Id);
	}

	@Override
	public boolean login(String id, String pw) {
		// TODO Auto-generated method stub
		
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("userid", id);
		parameters.put("pw", pw);
		
		UserVO result = session.selectOne("usersMapper.loginUser", parameters);
		
		if(result != null)
			return true;
		else
			return false;
			
	}

	

}
