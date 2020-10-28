package com.example.demo.dao;

import java.util.List;

import com.example.demo.domain.RoomVO;

public interface RoomDAO {
	
	public List<RoomVO> list(String id) throws Exception;
	
	public List<RoomVO> plist(String id) throws Exception;
	
	public RoomVO roomDetail(int room_id) throws Exception;
	
	public int roomInsert(RoomVO room) throws Exception;
	
	public int roomDelete(int room_id) throws Exception;
	
	public int update(RoomVO room) throws Exception;
}
