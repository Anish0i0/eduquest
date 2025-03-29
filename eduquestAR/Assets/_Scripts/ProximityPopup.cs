using TMPro;
using UnityEngine;

public class ProximityPopup : MonoBehaviour
{
    GameObject popupsParent;
    public BodyPart bodyPart;
    string title = "";
    string description = "";
    public GameObject popupPrefab;  // Assign the popup prefab in the inspector
    private GameObject popupInstance;
    private Transform cameraTransform;
    public float triggerDistance = 0.5f;  // Adjust as needed

    public TMP_Text distanceT;

    void Start()
    {
        switch (bodyPart)
        {
            case BodyPart.Head:
                title = "Head";
                description = "The head is the top part of your body! It holds your brain , which helps you think, learn, and remember things. Your eyes , ears , nose , and mouth are all on your head, helping you see, hear, smell, and talk.";
                break;
            case BodyPart.Chest:
                title = "Stomach";
                description = "Your stomach is in the middle of your body! It helps turn the food you eat into energy so you can run, play, and grow strong. Your stomach mixing food and sending the good stuff to the rest of your body!";
                break;
            case BodyPart.Legs:
                title = "Legs";
                description = "Your legs help you walk, run, jump, and dance! They have strong bones and muscles to carry you wherever you go. Your knees help you bend, and your feet help you stand.";
                break;
            default:
                break;
        }

        distanceT = GameObject.Find("distanceT").GetComponent<TMP_Text>();
        cameraTransform = Camera.main.transform;
        popupsParent = GameObject.Find("InfoPopupsParent");
    }

    void Update()
    {
        float distance = Vector3.Distance(cameraTransform.position, transform.position);

        distanceT.text = distance.ToString();

        if (distance < triggerDistance && popupInstance == null)
        {
            ShowPopup();
        }
        else if (distance >= triggerDistance && popupInstance != null)
        {
            Destroy(popupInstance);
        }
    }

    void ShowPopup()
    {
        popupInstance = Instantiate(popupPrefab, popupsParent.transform);
        // popupInstance.transform.SetParent(popupsParent.transform);

        // popupInstance.transform.position = Vector3.zero;

        popupInstance.transform.GetChild(0).GetChild(0).gameObject.GetComponent<TMP_Text>().text = title;
        popupInstance.transform.GetChild(0).GetChild(1).gameObject.GetComponent<TMP_Text>().text = description;

        // Find the close button and add a listener to destroy the popup
        popupInstance.GetComponentInChildren<UnityEngine.UI.Button>().onClick.AddListener(() =>
        {
            Destroy(popupInstance);
        });
    }
}

public enum BodyPart
{
    Head,
    Chest,
    Legs
}