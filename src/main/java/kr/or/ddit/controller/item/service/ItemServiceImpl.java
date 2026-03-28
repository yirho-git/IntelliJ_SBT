package kr.or.ddit.controller.item.service;

import kr.or.ddit.controller.item.mapper.IItemMapper;
import kr.or.ddit.vo.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl implements IItemService {
    @Autowired
    private IItemMapper mapper;

    @Override
    public int register(Item item) {
//        int rst = mapper.register(item);

//        string[] files = item.getfiles();
//
//        if(files!=null || files.length>0){
//
//            for(string filename : files){
//                mapper.addattach(filename);
//            }
//        }

        return 0;
    }
}
