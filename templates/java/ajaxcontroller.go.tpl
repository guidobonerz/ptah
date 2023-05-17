package {{getFullNameSpace}};
{{- $attributeList := getAttributes}}
{{- $primaryAttributes := getPrimaryAttributes}}
{{- $primaryAttributeTypes := getDataTypes $primaryAttributes }}
{{- $name := $.Name}}
{{- $controllerName := getObjectName "ajaxcontroller"}}
{{- $dtoName := getObjectName "dto"}}
{{- $serviceName := getObjectName "service"}}
{{- $sorter := getObjectName "sorter"}}
{{- $filter := getObjectName "filter"}}


import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

import {{getFullObjectName "service"}};
import {{getFullObjectName "dto"}};
import {{getFullObjectName "ajaxresponse"}};
import {{getFullObjectName "sorter"}};
import {{getFullObjectName "filter"}};

@RestController
@Slf4j
@RequestMapping("rest/{{$name}}")
public class {{$controllerName}} {
   
    @Autowired
    private MessageSource messageSource;
  
    @Autowired
    private {{$serviceName}} service;

    @GetMapping("get/{id}")
    @ResponseBody
    public AjaxResponse<String, {{$dtoName}}> get(final @PathVariable(required = false) Long id) {
        log.info("call get:{{$name}}");
        AjaxResponse<String, {{$dtoName}}> response = new AjaxResponse<>(true, "{{$name}} get successfully");
        Result<{{$dtoName}}> result = null;
        try {
            result = service.get(id);
            result.getResultList().get(0);
            response.setData(result.getResultList().get(0));
            response.setTotal(1);
        } catch (Exception ex) {
            log.error("failed to get {{$name}}", ex);
            response.setTotal(0);
            response.setSuccess(false);
            response.setMessage("failed to get {{$name}}");
        }
        return response;
    }

    @GetMapping("list")
    @ResponseBody
    public AjaxResponse<String, List<{{$dtoName}}>> list(@RequestParam(name = "start", required = false, defaultValue = "0") final int start,
            @RequestParam(name = "length", required = false, defaultValue = "0") final int length,
            @RequestParam(name = "search", required = false) final String search,
            @RequestParam(name = "sort", required = false) final String sort,
            @RequestParam(name = "filter", required = false) final String filter) {
        log.info("call list:{{$name}}");
        final AjaxResponse<String, List<{{$dtoName}}>> response = new AjaxResponse<>(true,"{{$name}} successfully listet");
        try {

            List<{{$sorter}}> sorterList = null;
            List<{{$filter}}> filterList = null;

            final List<{{$dtoName}}> list = service.list(start, length, search, sorterList, filterList);
            int = service.count(start, length, search, sorter, filter);
            response.setData(result.getResultList());
            response.setTotal(result.getTotal());
        } catch (final Exception ex) {
            log.error("failed to list {{$name}}", ex);
            response.setTotal(0);
            response.setSuccess(false);
            response.setMessage("failed to list {{$name}}");
        }
        return response;
    }

    @PostMapping("add")
    @ResponseBody
    public AjaxResponse<String, String> add(@RequestBody final {{$dtoName}} item) {
        log.info("call add:{{$name}}");
        final AjaxResponse<String, String> response = new AjaxResponse<>(true, "{{$name}} successfully added");
        try {
            service.add(item);
        } catch (final Exception ex) {
            log.error("failed to add {{$name}}", ex);
            response.setTotal(0);
            response.setSuccess(false);
            response.setMessage("failed to add {{$name}}");
        }
        return response;
    }

    @PutMapping("update")
    @ResponseBody
    public AjaxResponse<String, String> update(@RequestBody final {{$dtoName}} item) {
        log.info("call update:{{$name}}");
        final AjaxResponse<String, String> response = new AjaxResponse<>(true, "{{$name}} successfully updated");
        try {
            service.update(item);
        } catch (final Exception ex) {
            log.error("failed to update {{$name}}", ex);
            response.setTotal(0);
            response.setSuccess(false);
            response.setMessage("failed to update {{$name}}");
        }
        return response;
    }

    @DeleteMapping("delete")
    @ResponseBody
    public AjaxResponse<String, String> deleteProject(@RequestBody final {{$dtoName}} item) {
        log.info("call delete:{{$name}}");
        final AjaxResponse<String, String> response = new AjaxResponse<>(true, "{{$name}} successfully deleted");
        try {
            service.delete(item);
        } catch (final Exception ex) {
            log.error("failed to delete {{$name}}", ex);
            response.setTotal(0);
            response.setSuccess(false);
            response.setMessage("failed to delete {{$name}}");
        }
        return response;
    }
}
