package com.example.demo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.demo.dao.RoomDAO;
import com.example.demo.domain.PtUserVO;
import com.example.demo.domain.RoomVO;

@Service("com.example.demo.service.RoomServiceImpl")
public class RoomServiceImpl implements RoomService {
	
	@Inject 
	private RoomDAO dao;
	
	@Override
	public List<RoomVO> list(String id) throws Exception{
        return dao.list(id);
    }
	@Override
	public List<PtUserVO> plist(String id) throws Exception{
		return dao.plist(id);
	}
	@Override
	public RoomVO roomDetail(int room_id) throws Exception{
		return dao.roomDetail(room_id);
	}
	@Override
	public int roomInsert(RoomVO room) throws Exception{
		return dao.roomInsert(room);
	}
	@Override
	public int roomDelete1(int room_id) throws Exception{
		return dao.roomDelete1(room_id);
	}
	@Override
	public int roomDelete2(int room_id) throws Exception{
		return dao.roomDelete2(room_id);
	}
	@Override
	public int roomDelete3(int room_id) throws Exception{
		return dao.roomDelete3(room_id);
	}
	@Override
	public int update(PtUserVO room) throws Exception{
		return dao.update(room);
	}
//	@Override
//	public List<RoomVO> pplist(String id) throws Exception{
//		return dao.ppist(id);
//	}
}
