package kr.or.ddit.controller.item;

import kr.or.ddit.controller.item.service.IItemService;
import kr.or.ddit.vo.Item;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private IItemService service;

    // application property에 있는 저장소 경로를 가져옴
    // 코드 파일에 직접 지정하면(하드코딩) 경로가 바뀔때마다 재빌드 해야함
    @Value("${kr.or.ddit.upload.path}")
    private String uploadPath;

    /*
     * 업로드 파일 컨트롤러
     * @description : ajax 비동기 파일업로드,
     * register form에서 등록할 파일을 선택 할때마다 uploadPath의 경로(내 로컬 저장소)에 파일저장
     * form을 submit하면 DB에 등록.
     * !주의 : 선택만하고 폼 전송을 하지 않을시 '고아 파일'로 디스크에 남음(용량 주의)
     * @return ResponseEntity<byte[]>
     */
    @ResponseBody
    @PostMapping(value="/uploadFile", produces="text/plain;charset=utf-8" )
    public ResponseEntity<byte[]> uploadFile(String fileName) {
        log.info("uploadFile()...");
        InputStream in = null;
        ResponseEntity<byte[]> entity = null;


    }

    @GetMapping("/register")
    public String registerForm(){
        log.info("registerForm()...");

        return "itemView/register";
    }

    @PostMapping("/register")
    public String register(Model model,Item item){
        log.info("register...");

        int rst = 0;
        rst = service.register(item);

        model.addAttribute("msg", "등록 성공");
        return "itemView/success";
    }




}
