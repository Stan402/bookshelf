package ru.stan402.bookshelf.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.stan402.bookshelf.entity.Book;
import ru.stan402.bookshelf.service.BooksService;
import ru.stan402.bookshelf.util.BookSearch;

import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping("/books")
public class BookController {

    private final static int FIRST_PAGE = 1;
    private final static int RAWS_LIMIT = 10;

    @Autowired
    private BooksService booksService;

    private BookSearch theSearch;

    @GetMapping("/list")
    public String listBooks(@RequestParam(value = "pg", required = false) Integer pg,
            Model model){

        if(theSearch == null) theSearch = new BookSearch();

        int bookCount = booksService.getBookCount(theSearch);

        int page = FIRST_PAGE;
        if (pg != null) page = pg;
        int lastPage = bookCount/RAWS_LIMIT;
        if (bookCount % RAWS_LIMIT > 0) lastPage++;
        if (page < FIRST_PAGE) page = FIRST_PAGE;
        if (page > lastPage) page = lastPage;

        List<Book> books = booksService.getBooks(theSearch, page, RAWS_LIMIT);

        model.addAttribute("books", books);
        model.addAttribute("page", page);
        model.addAttribute("lastPage", lastPage);

        return "list-books";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model model){

        model.addAttribute("book", new Book());

        return "add-book";
    }

    @GetMapping("/showFormForSearch")
    public String showFormForSearch(Model model){

        model.addAttribute("search", new BookSearch());

        return "search-book";
    }
    @GetMapping("/showAll")
    public String showAll(Model model){

        theSearch = new BookSearch();

        return "redirect:/books/list";
    }

    @PostMapping("/saveBook")
    public String saveBook(@Valid @ModelAttribute("book") Book book,
                           BindingResult bindingResult){

        if (bindingResult.hasErrors()){
            if (book.getId() > 0)
                return "update-book";
            else
                return "add-book";
        }

        booksService.saveBook(book);
        return "redirect:/books/list";
    }

    @PostMapping("/searchBook")
    public String searchBook(@ModelAttribute("search") BookSearch search){
        System.out.println(search);
        theSearch = search;
        return "redirect:/books/list";
    }


    @GetMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("bookId") int id, Model model){

        Book book = booksService.getBook(id);

        model.addAttribute("book", book);

        return "update-book";
    }

    @GetMapping("/delete")
    public String deleteBook(@RequestParam("bookId") int id){
        booksService.delete(id);

        return "redirect:/books/list";
    }
    
    @GetMapping("/read")
    public String readBook(@RequestParam("bookId") int id){
        booksService.readBook(id);

        return "redirect:/books/list";
    }
}

