package com.example.demo.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.demo.domain.PtUserVO;
import com.example.demo.domain.RoomVO;

@Repository
public class RoomDAOImpl implements RoomDAO {

	@Inject SqlSession sql;
		
	@Override
	public List<RoomVO> list(String id) throws Exception{
		return sql.selectList("com.example.demo.mappers.roomMapper.list",id);
	}
	@Override
	public List<PtUserVO> plist(String id) throws Exception{
		return sql.selectList("com.example.demo.mappers.roomMapper.plist",id);
	}
	@Override
	public RoomVO roomDetail(int room_id) throws Exception{
		return sql.selectOne("com.example.demo.mappers.roomMapper.roomDetail",room_id);
	}
	@Override
	public int roomInsert(RoomVO room) throws Exception{
		return sql.insert("com.example.demo.mappers.roomMapper.roomInsert",room);	
	}
	@Override
	public int roomDelete(int room_id) throws Exception{
		return sql.delete("com.example.demo.mappers.roomMapper.roomDelete",room_id);
	}
	@Override
	public int update(PtUserVO room) throws Exception{
		return sql.insert("com.example.demo.mappers.roomMapper.update",room);
	}
//	@Override
//	public List<RoomVO> ppist(String id) throws Exception{
//		return sql.selectList("com.example.demo.mappers.roomMapper.pplist",id);
//	}
}
