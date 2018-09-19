package com.stewart.Languages.controllers;

import java.util.ArrayList;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stewart.Languages.models.Language;
import com.stewart.Languages.services.LanguageService;

@Controller
@RequestMapping("/languages")
public class LanguageController {
	private LanguageService langServ;

	public LanguageController(LanguageService langServ) {
		this.langServ = langServ;
	}
	
	@GetMapping("")
	public String showAll(@ModelAttribute("language") Language language, Model model) {
		ArrayList<Language> languageAll = langServ.findAll();
		model.addAttribute("languages", languageAll);
		return "index.jsp";
	}
	
	@PostMapping("/create")
	public String createLang(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if(result.hasErrors()) {
			return "index.jsp";
		} else {
			langServ.create(language);
			return "redirect:/languages";
		}
	}
	
	@GetMapping("/info/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language lang = langServ.findById(id);
		model.addAttribute("lang", lang);
		return "info.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language lang = langServ.findById(id);
		model.addAttribute("lang", lang);
		return "edit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String saveEdit(@Valid @ModelAttribute("language") Language language, BindingResult result) {
		if(result.hasErrors()) {
			return "edit.jsp";
		} else {
			langServ.updateLang(language);
			return "redirect:/languages";
		}
	}
	
	@DeleteMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		System.out.println("here");
		langServ.deleteLanguage(id);
		return "redirect:/languages";
	}
}
