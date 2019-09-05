import UIKit

class ViewController: UIViewController {
    
    var nasaData = [NasaPhotos.PhotosInfo]()
    
    
    
    @IBOutlet weak var NasaTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProtocols()
        fetchData()
    }
    
    private var pictures = [UIImage]() {
        didSet {
            DispatchQueue.main.async {
                self.NasaTableView.reloadData()
                
            }
            
        }
    }
    

    
    
    func fetchData() {
        NasaAPIClient.getPhoto { (result) in
            switch result {
            case .failure(let error):
                error.errorMessage()
            case .success(let data):
                self.nasaData = data.photos
            }
            
            for i in self.nasaData {
                ImageHelper.getAnImage(stringUrl: i.img_src, completionHandler: { (error, image) in
                    if let image = image {
                        self.pictures.append(image)
                    }
                })
            }
        }
        
        
    }
    

            
        
        
    
    
    func setProtocols() {
        NasaTableView.dataSource = self
        NasaTableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = NasaTableView.indexPathForSelectedRow,
            let destination = segue.destination as? DetailedViewController else { return }
//            var dataToSendOver = pictures[indexPath.row]
//        destination.selectedImage.image = dataToSendOver
    }
    
    
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NasaCell") else { return UITableViewCell() }
        let dataToSet = nasaData[indexPath.row]
        let picturesToPass = pictures[indexPath.row]
        cell.textLabel?.text = dataToSet.earth_date
        cell.imageView?.image = picturesToPass
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

