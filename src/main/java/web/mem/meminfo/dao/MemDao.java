package web.mem.meminfo.dao;

import java.util.List;

import web.mem.meminfo.entity.Mem;

public interface MemDao {
	
	int insert(Mem mem);

	int delectByMemNo(Integer memNo);
	
	int updateAll(Mem mem);
	
	int updateMemInfo(Mem mem);
	
	int updateMemImage(byte[] memPic, Integer memNo);
	
	int updateMemEmail(String memEmail, Integer memNo);
	
	int updateMemPassword(String newMemPwd, Integer memNo);
	
	int updateMemAccStatus(Integer memAccStatus, Integer memNo);
	
	int updateMemAccAndActStatus(Integer memAccStatus, Integer memActStatus, Integer memNo);
	
	Mem selectByMemNo(Integer memNo);
	
	Mem selectByMemAcc(String memAcc);
	
	Mem selectByMemEmail(String memEmail);
	
	Mem selectByMemMobile(String memMobile);
	
	Mem selectAccAndPwd(String memAcc, String memPwd);
	
	List<Mem> selectAll();
	
	List<Mem> selectByAccStatus(Integer AccStatus);
	
	List<Mem> selectByMemAccLike(String searchContent);
	
	List<Mem> selectByMemEmailLike(String searchContent);
	
	List<Mem> selectByMemMobileLike(String searchContent);
	
}
